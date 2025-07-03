# Infraestructura de aprendiendo con personajes

En este repositorio se encuentra la infraestructura necesaria para ejecutar todo el software. 

## Cómo ejecutar

Copiar y completar las variables de entorno

```bash
cp .env.template .env
```

Crear las networks

```bash
chmod +x ./create_networks
./create_networks
```

Levantar los contenedores

```bash
docker compose up
```

Seedear los buckets de minio (Opcional pero recomendado)

```bash
chmod +x ./seed_minio.sh
./seed_minio.sh
```
