# es-sfomuseum-schema

## Opensearch

Using tools provided by [whosonfirst/go-whosonfirst-opensearch](https://github.com/whosonfirst/go-whosonfirst-opensearch):

```
$> ./bin/wof-opensearch-list-indices -opensearch-insecure -opensearch-endpoint http://localhost:9200
yellow	CiqKuP_LSAez11nCKgaI4A	millsfield
yellow	rW3u3mPDQXie-nOLGQ4Phw	collection
yellow	hLxaVQcYSWK6MAOJlHPaww	libraryofcongress

$> ./bin/wof-opensearch-delete-index -opensearch-index collection -opensearch-insecure -opensearch-endpoint http://localhost:9200
{"acknowledged":true}

$>  ./bin/wof-opensearch-create-index -opensearch-index collection -opensearch-insecure -opensearch-endpoint http://localhost:9200 -settings /usr/local/sfomuseum/es-sfomuseum-schema/opensearch/2.x/collection.settings.json
{"acknowledged":true,"shards_acknowledged":true,"index":"collection"}

$> ./bin/wof-opensearch-list-indices -opensearch-insecure -opensearch-endpoint http://localhost:9200
yellow	CiqKuP_LSAez11nCKgaI4A	millsfield
yellow	VbrCTJ8SSbKxp0RWIefeaw	collection
yellow	hLxaVQcYSWK6MAOJlHPaww	libraryofcongress
```

## See also

* https://github.com/whosonfirst/go-whosonfirst-opensearch
* https://github.com/sfomuseum/go-whosonfirst-elasticsearch
