dev:
	cat schema/2.4/mappings.collection.json | curl -s -XPUT http://localhost:9200/collection -d @-

health:
	curl -s localhost:9200/_cluster/health | jq

refresh:
	curl -XDELETE http://localhost:9200/millsfield
	cat schema/7.4/mappings.millsfield.json | curl -XPUT -H 'Content-type: application/json' http://localhost:9200/millsfield -d @-
	curl -H 'Content-type:application/json' -XPUT http://localhost:9200/millsfield/_settings -d '{"index.mapping.total_fields.limit": 3000}'

count:
	curl -X POST 'http://localhost:9200/_count?q=*'
