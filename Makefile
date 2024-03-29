health:
	curl -s $(HOST)/_cluster/health | jq

# suuuuuuuuper important in AWS-land: ensure $(HOST) does not have a trailing slash

# this doesn't work in AWS ES and is a bad idea anyway (20200630/thisisaaronland)

refresh-collection-dev:
	@make refresh HOST=http://localhost:9200 MAPPINGS=collection INDEX=collection

refresh:
	curl -XDELETE $(HOST)/$(INDEX)
	cat schema/7.4/mappings.$(MAPPINGS).json | curl -XPUT -H 'Content-type: application/json' $(HOST)/$(INDEX) -d @-
	curl -H 'Content-type:application/json' -XPUT $(HOST)/$(INDEX)/_settings -d '{"index.mapping.total_fields.limit": 5000}'

create:
	cat schema/7.4/mappings.$(MAPPINGS).json | curl -XPUT -H 'Content-type: application/json' $(HOST)/$(INDEX) -d @-

limits:
	curl -H 'Content-type:application/json' -XPUT $(HOST)/$(INDEX)/_settings -d '{"index.mapping.total_fields.limit": 5000}'

count:
	curl -s '$(HOST)/$(INDEX)/_count' | jq '.count'
