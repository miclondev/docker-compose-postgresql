# PostgreSQL with pgAdmin - Docker Compose Setup

This repository contains a Docker Compose configuration for quickly spinning up a PostgreSQL database with pgAdmin web interface for local development.

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Services

This Docker Compose setup includes:

1. **PostgreSQL**: A powerful, open-source relational database
2. **pgAdmin**: A web-based administration tool for PostgreSQL

## Quick Start

1. Clone this repository:

   ```bash
   git clone <your-repository-url>
   cd <repository-directory>
   ```

2. Start the services:

   ```bash
   docker-compose up -d
   ```

3. Access pgAdmin:

   - Open your browser and navigate to: http://localhost:5050
   - Login with:
     - Email: admin@admin.com
     - Password: admin

4. Connect to PostgreSQL in pgAdmin:
   - Right-click on "Servers" in the left panel and select "Create" > "Server"
   - On the "General" tab, provide a name for your connection (e.g., "Local Docker PostgreSQL")
   - On the "Connection" tab, enter:
     - Host name/address: postgres
     - Port: 5432
     - Maintenance database: postgres
     - Username: postgres
     - Password: postgres
   - Click "Save"

## Connection Details

### PostgreSQL

- **Host**: localhost (from your machine) or postgres (from other containers)
- **Port**: 5432
- **Username**: postgres
- **Password**: postgres
- **Default Database**: postgres

### pgAdmin

- **URL**: http://localhost:5050
- **Email**: admin@admin.com
- **Password**: admin

## Data Persistence

PostgreSQL data is stored in a Docker volume named `postgres-data`, ensuring your data persists even when containers are stopped or removed.

## Customization

You can customize the setup by modifying the `docker-compose.yml` file:

- Change PostgreSQL credentials by updating the environment variables in the `postgres` service
- Change pgAdmin credentials by updating the environment variables in the `pgAdmin` service
- Modify port mappings if ports 5432 or 5050 are already in use on your host machine

## Stopping the Services

To stop all services:

```bash
docker-compose down
```

To stop and remove all data volumes (warning: this will delete your database data):

```bash
docker-compose down -v
```

## Additional Information

- PostgreSQL official image: [Docker Hub](https://hub.docker.com/_/postgres)
- pgAdmin official image: [Docker Hub](https://hub.docker.com/r/dpage/pgadmin4)
