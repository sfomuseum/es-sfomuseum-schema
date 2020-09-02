health:
	curl -s $(HOST)/_cluster/health | jq

# suuuuuuuuper important in AWS-land: ensure $(HOST) does not have a trailing slash

# this doesn't work in AWS ES and is a bad idea anyway (20200630/thisisaaronland)

refresh:
	curl -XDELETE $(HOST)/millsfield
	cat schema/7.4/mappings.millsfield.json | curl -XPUT -H 'Content-type: application/json' $(HOST)/millsfield -d @-
	curl -H 'Content-type:application/json' -XPUT $(HOST)/millsfield/_settings -d '{"index.mapping.total_fields.limit": 3500}'

create:
	cat schema/7.4/mappings.millsfield.json | curl -XPUT -H 'Content-type: application/json' $(HOST)/$(INDEX) -d @-
	curl -H 'Content-type:application/json' -XPUT $(HOST)/$(INDEX)/_settings -d '{"index.mapping.total_fields.limit": 3500}'

count:
	curl -X POST '$(HOST)/_count?q=*'
