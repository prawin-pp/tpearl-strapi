#!/usr/bin/env -S bash -e

BASE_PATH="$( cd -- "$(dirname "$0")/../.." >/dev/null 2>&1 ; pwd -P )"

usage() {
  cat <<EOUSAGE
Usage: $0 [create|up|down|force|version|reset] {#}"
     : $0 seed
EOUSAGE
}

create () {
  docker run -it --rm -v $BASE_PATH/migrations:/migrations --network host \
    migrate/migrate create \
    -ext sql \
    -dir migrations \
    -seq $1
}

migrate () {
  command=$1
  args=$2
  [[ -z $args ]] && cmd="$command" || cmd="$command $args"
  docker run -it --rm -v $BASE_PATH/migrations:/migrations --network host \
    migrate/migrate -path=/migrations/ -database "$connection" $cmd
}

seed () {
  for filename in $BASE_PATH/devtools/seed/*.sql; do
    [ -f "$filename" ] || continue
    path="/seed/$(basename $filename)"
    echo -e "\nImport: $(basename $filename)"
    docker run --rm -v $BASE_PATH/devtools/seed:/seed:ro --network host \
      postgres:14 psql "$connection" -f "$path"
  done
}

database_user="strapi"
database_password="strapi"
database_host="localhost"
database_name="tpearl"
cmd=""

while [[ "$#" -gt 0 ]]; do
  case "$1" in
    --host)
        database_host="$2"
        shift 2
        ;;
    --user)
        database_user="$2"
        shift 2
        ;;
    --password)
        database_password="$2"
        shift 2
        ;;
    --name)
        database_name="$2"
        shift 2
        ;;
    create|up|down|force|version|seed|reset)
        cmd="$1"
        shift
        break
        ;;
    -h|--help|*)
        usage
        exit 1
        ;;
  esac
done

connection="postgresql://$database_user:$database_password@$database_host:5432/$database_name?sslmode=disable"

case "$cmd" in
  create)
    create $@
    ;;
  up|down|force|version)
    migrate $cmd $@
    ;;
  seed)
    seed
    ;;
  reset)
    echo -e "\nDeleting..."
    migrate down -all
    echo -e "\nCreating..."
    migrate up
    echo -e "\nImporting..."
    seed
    ;;
  *)
    usage
    exit 1
    ;;
esac
