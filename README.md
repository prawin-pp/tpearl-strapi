# Tpearl API

`tpearl-api` is a RESTful API built using the Strapi framework that allows you to manage products, product-addons, categories, and payment channels for an `tpearl-shop`. It provides endpoints for creating, reading, updating, and deleting resources, and supports authentication and authorization.

## Getting Started

### Prerequisites

Before running `tpearl-api`, you must have the following installed:
- Docker (v19 or later)

### Installation

To install and run the project, follow these steps:

1. Clone the repository or download the source code.
2. Run the application using the following command:

```bash
docker compose up
```

The API will be accessible at `http://localhost:1337`.

### Example data

To run the application using example data using the following command:

```bash
./devtools/scripts/migration_db.sh seed
```

