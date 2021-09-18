rm -rf ./tmp
docker build -t zstd-linux .
id=$(docker create zstd-linux)
docker cp $id:/runtimes ./tmp
docker rm -v $id
rsync -a --remove-source-files tmp/ runtimes/