class AmazonHelper
  require "right_aws_api"

  def initialize(upc)
    @upc = upc
  end

  def paa
    key      = ENV['AWS_ACCESS_KEY_ID']
    secret   = ENV['AWS_SECRET_KEY']
    endpoint = 'https://webservices.amazon.com'
    RightScale::CloudApi::ECS::PA::Manager.new(key, secret, endpoint)
  end

  def dvd_search
    paa.ItemLookup(
      'AssociateTag' => 'ASSOCIATE_TAG',
      'IdType' => 'UPC',
      'ItemId' => "#{@upc}",
      'SearchIndex' => 'Movies',
      'ResponseGroup' => 'EditorialReview,Images,ItemAttributes,ItemIds,OfferSummary,Tracks',
    )
  end
end
