Docker Tile Live Copy
==============

Docker container for copying/generating tilelive tiles 

Uses: [https://github.com/mojodna/tl](https://github.com/mojodna/tl) and [https://github.com/mapbox/tilelive.js](https://github.com/mapbox/tilelive.js)

Examples of things you can do:
- generate tiles with Mapnik and push them to S3
- generate vector tiles and save in MBTiles format

# Usage

## Docker Compose

- `cp docker-compose-example.yml to docker-compose.yml`
- modify docker-compose.yml 
- run: `docker-compose up`

## Docker

```
docker run -v ./configs:/configs -v ./data:data -z 1 -Z 10 -r tilelive-mapnik "mapnik:///configs/mapnik.xml" "file://data/tiles"
```

# Adding Additional Tilelive Modules

Already Included

- tilelive-mapnik
- tilelive-s3
- mbtiles
- tilelive-file

```
npm install -g yarn
yarn add tilelive-tmstyle
```