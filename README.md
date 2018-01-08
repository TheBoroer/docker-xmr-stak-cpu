# Alpine xmr-stak-cpu Miner
[xmr-stak-cpu](https://github.com/fireice-uk/xmr-stak-cpu) miner in an Alpine Docker image.

The goal of this project is to quickly enable you to mine CryptoNight Coins using the xmr-stak-cpu miner without the hassle of knowing how to install or secure it. 
Using an [Alpine Linux](https://www.alpinelinux.org/) container you get the benefit of Pax and grsecuirty and, on top of this the miner runs under its own user.

# Configure via Environment Variable
| Variable | Default Value | Required |
| --- | :---: | :---: |
| MINE_URL | "" | * |
| MINE_WALLET | "" | * |
| MINE_PASSWORD | "x" |  |
| MINE_THREADS | 1 |  |
| MINE_NICEHASH | false |  |
| CPU_LOW_POWER_MODE | false |  |
| CPU_NO_PREFETCH | true |  |
| VERBOSE_LEVEL | 4 |  |
| H_PRINT_TIME | 60 |  |
| PREFER_IPV4 | true |  |
| CALL_TIMEOUT | 10 |  |
| RETRY_TIMEOUT | 10 |  |
| GIVEUP_LIMIT | 0 |  |


# Run via Docker CLI
```bash
docker run boro/xmr-stak-cpu -e MINE_URL='cryptonight.usa.nicehash.com:3355' \
                             -e MINE_WALLET='3BAqUNegyr7WdqeZLHb42NsE5aa1phAGwt.DockerWorker' \
                             -e MINE_PASSWORD='x' \
                             -e MINE_THREADS='4' \
                             -e MINE_NICEHASH='true'
```

# Run via Docker Compose:
```
```

# Run via Rancher Compose
```
```



# Dev Donations

By default the miner will donate 1% of the hashpower (1 minute in 100 minutes) to the developers of xmr-stak-cpu: [(fireice-uk)](https://github.com/fireice-uk) and [psychocrypt](https://github.com/psychocrypt)

If you want to donate directly to support further development of the xmr-stak-cpu tool, here are their wallets.

fireice-uk:
`4581HhZkQHgZrZjKeCfCJxZff9E3xCgHGF25zABZz7oR71TnbbgiS7sK9jveE6Dx6uMs2LwszDuvQJgRZQotdpHt1fTdDhk`

psychocrypt:
`43NoJVEXo21hGZ6tDG6Z3g4qimiGdJPE6GRxAmiWwm26gwr62Lqo7zRiCJFSBmbkwTGNuuES9ES5TgaVHceuYc4Y75txCTU`

If you would like to thank me for creating this docker container image my XMR wallet address:
`43xXA3AsQVx1nDaoRUQPrSN9xQi6FDU181Dsiz3diUbi9NJUyb8LTy4NisH8uqEML1Se7GuHnhUaSKeuQj3dESUr5jpYFgX`