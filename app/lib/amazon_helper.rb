class AmazonHelper

  attr_reader :response

  def initialize(upc)
    @upc = upc
    @response = dvd_search
  end

  def paa
    key      = ENV['AWS_ACCESS_KEY_ID']
    secret   = ENV['AWS_SECRET_KEY']
    endpoint = 'https://webservices.amazon.com'
    RightScale::CloudApi::ECS::PA::Manager.new(key, secret, endpoint)
  end

  def dvd_search
    response = paa.ItemLookup(
      'AssociateTag' => 'ASSOCIATE_TAG',
      'IdType' => 'UPC',
      'ItemId' => "#{@upc}",
      'SearchIndex' => 'Movies',
      'ResponseGroup' => 'EditorialReview,Images,ItemAttributes,Tracks',
    )
    response["ItemLookupResponse"]["Items"]["Item"]
  end

  def title
    title = item_attributes("Title")
  end

  def mpaa
    rating = item_attributes("AudienceRating")
  end

  def studio
    studio = director = item_attributes("Studio")
  end

  def director
    director = item_attributes("Director")
  end

  def release_date
    date = item_attributes("ReleaseDate")
  end

  def run_time
    time = ''
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["RunningTime"].nil?
          ammount = @response["ItemAttributes"]["RunningTime"]["@@text"]
          unit = @response["ItemAttributes"]["RunningTime"]["@Units"]
          time = "#{ammount} #{unit}"
        end
      end
    else
      if !@response["ItemAttributes"]["RunningTime"].nil?
        ammount = @response["ItemAttributes"]["RunningTime"]["@@text"]
        unit = @response["ItemAttributes"]["RunningTime"]["@Units"]
        time = "#{ammount} #{unit}"
      end
    end
    time
  end

  def cast
    cast = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Actor"].nil?
          cast = @response["ItemAttributes"]["Actor"]
        end
      end
    else
      if !@response["ItemAttributes"]["Actor"].nil?
        cast = @response["ItemAttributes"]["Actor"]
      end
    end
    cast.join(", ")
  end

  def producer
    producer = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Creator"].nil?
          @response["ItemAttributes"]["Creator"].each do |creator|
            if creator["@Role"] == "Producer"
              producer << creator["@@text"]
            end
          end
        end
      end
    else
      if !@response["ItemAttributes"]["Creator"].nil?
        @response["ItemAttributes"]["Creator"].each do |creator|
          if creator["@Role"] == "Producer"
            producer << creator["@@text"]
          end
        end
      end
    end
    producer.join(", ")
  end

  def writer
    writer = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Creator"].nil?
          @response["ItemAttributes"]["Creator"].each do |creator|
            if creator["@Role"] == "Writer"
              writer << creator["@@text"]
            end
          end
        end
      end
    else
      if !@response["ItemAttributes"]["Creator"].nil?
        @response["ItemAttributes"]["Creator"].each do |creator|
          if creator["@Role"] == "Writer"
            writer << creator["@@text"]
          end
        end
      end
    end
    writer.join(", ")
  end

  def synopsis
    synopsis = ''
    if @response.class == Array
      @response.each do |item|
        if !item["EditorialReviews"].nil?
          synopsis = item["EditorialReviews"]["EditorialReview"]["Content"]
        end
      end
    else
      if !@response["EditorialReviews"].nil?
        synopsis = @response["EditorialReviews"]["EditorialReview"]["Content"]
      end
    end
    synopsis
  end

  private

  def item_attributes(response_field)
    output_string = ''
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"][response_field].nil?
          output_string = item["ItemAttributes"][response_field]
        end
      end
    else
      if !@response["ItemAttributes"][response_field].nil?
        output_string = @response["ItemAttributes"][response_field]
      end
    end
    output_string
  end

end
