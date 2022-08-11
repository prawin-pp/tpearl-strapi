export default ({ env }) => ({
  url: env('URL'),
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'b10d450f812e0178afb55672fd8673a2'),
  },
});
