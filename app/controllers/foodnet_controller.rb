require 'httparty'
require 'ckan'

REST_API = "http://demo.ckan.org/api/3/action"
AUTH_KEY = "upRQngIuH8UPWVrpJzZkadM2OipwO0y6oKBqXxR8"

SAMPLE_TAG = "Topics"
SAMPLE_SUB_TAG = "education"
NUM_OF_TAGS = 10.to_s

class FoodnetController < ApplicationController
  def net
     #@data = searchTag(SAMPLE_TAG)
     #@data = searchSubTags(SAMPLE_TAG, SAMPLE_SUB_TAG)
     @data = topTags()
  end
end

# ckan API actions aka my very own client
def getTags
 return HTTParty.get(REST_API + '/tag_list')
end

# returns list of top data sets
def topTags
 return HTTParty.get(REST_API + '/package_search?facet.field=[%22tags%22]&facet.limit=' + NUM_OF_TAGS + '&rows=0')
end

# search all datasets for given tag
def searchTag(tag)
 return HTTParty.get(REST_API + '/package_search?fq=tags:' + tag)
end

# A list of datasets using subtag from vocabulary tag:
def searchSubTags(tag, subtag)
 return HTTParty.get('https://data.hdx.rwlabs.org/api/3/action/package_search?fq=vocab_' + tag + ':' + subtag)
end
