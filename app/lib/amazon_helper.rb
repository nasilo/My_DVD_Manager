class AmazonHelper

  attr_reader :response

  def initialize(upc)
    @upc = upc
    @response = dvd_search["Item"]
    @errors = dvd_search["Request"]["Errors"]
  end

  def paa
    key      = ENV['AWS_ACCESS_KEY_ID']
    secret   = ENV['AWS_SECRET_KEY']
    endpoint = 'https://webservices.amazon.com'
    RightScale::CloudApi::ECS::PA::Manager.new(key, secret, endpoint, :cache => true)
  end

  def dvd_search
    response = paa.ItemLookup(
      'AssociateTag' => 'ASSOCIATE_TAG',
      'IdType' => 'UPC',
      'ItemId' => "#{@upc}",
      'SearchIndex' => 'Movies',
      'ResponseGroup' => 'EditorialReview,Images,ItemAttributes,Tracks',
    )
    response["ItemLookupResponse"]["Items"]
  end

  def error
    if @errors
      return true
    end
  end

  def error_message
    output = 'Amazon says: '
    if @errors
      if @errors.class == Array
        @errors.each do |error|
          output += error["Error"]["Message"]
        end
      else
        output += @errors["Error"]["Message"]
      end
    end
    output
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
          ammount = item["ItemAttributes"]["RunningTime"]["@@text"]
          unit = item["ItemAttributes"]["RunningTime"]["@Units"]
          time = "#{ammount} #{unit}"
        end
      end
    elsif !@response["ItemAttributes"]["RunningTime"].nil?
      ammount = @response["ItemAttributes"]["RunningTime"]["@@text"]
      unit = @response["ItemAttributes"]["RunningTime"]["@Units"]
      time = "#{ammount} #{unit}"
    end
    time
  end

  def cast
    cast = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Actor"].nil?
          cast = item["ItemAttributes"]["Actor"]
        end
      end
    elsif !@response["ItemAttributes"]["Actor"].nil?
      cast = @response["ItemAttributes"]["Actor"]
    end
    cast.join(", ")
  end

  def producer
    producer = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Creator"].nil?
          if item["ItemAttributes"]["Creator"].class == Array
            item["ItemAttributes"]["Creator"].each do |creator|
              if creator["@Role"] == "Producer"
                producer << creator["@@text"]
              end
            end
          elsif item["ItemAttributes"]["Creator"]["@Role"] == "Producer"
            producer << item["ItemAttributes"]["Creator"]["@@text"]
          end
        end
      end
    elsif !@response["ItemAttributes"]["Creator"].nil?
      if @response["ItemAttributes"]["Creator"].class == Array
        @response["ItemAttributes"]["Creator"].each do |creator|
          if creator["@Role"] == "Producer"
            producer << creator["@@text"]
          end
        end
      elsif @response["ItemAttributes"]["Creator"]["@Role"] == "Producer"
        producer << @response["ItemAttributes"]["Creator"]["@@text"]
      end
    end
    producer.join(", ")
  end

  def writer
    writer = []
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"]["Creator"].nil?
          if item["ItemAttributes"]["Creator"].class == Array
            item["ItemAttributes"]["Creator"].each do |creator|
              if creator["@Role"] == "Writer"
                writer << creator["@@text"]
              end
            end
          elsif item["ItemAttributes"]["Creator"]["@Role"] == "Writer"
            writer << item["ItemAttributes"]["Creator"]["@@text"]
          end
        end
      end
    elsif !@response["ItemAttributes"]["Creator"].nil?
      if @response["ItemAttributes"]["Creator"].class == Array
        @response["ItemAttributes"]["Creator"].each do |creator|
          if creator["@Role"] == "Writer"
            writer << creator["@@text"]
          end
        end
      elsif @response["ItemAttributes"]["Creator"]["@Role"] == "Writer"
        writer << @response["ItemAttributes"]["Creator"]["@@text"]
      end
    end
    writer.join(", ")
  end

  def synopsis
    synopsis = ''
    if @response.class == Array
      @response.each do |item|
        if !item["EditorialReviews"].nil?
          if item["EditorialReviews"]["EditorialReview"].class == Array
            item["EditorialReviews"]["EditorialReview"].each do |review|
              synopsis += review["Content"]
              synopsis += "\n-#{review['Source']}\n"
            end
          else
            synopsis = item["EditorialReviews"]["EditorialReview"]["Content"]
          end
        end
      end
    elsif !@response["EditorialReviews"].nil?
      if @response["EditorialReviews"]["EditorialReview"].class == Array
        @response["EditorialReviews"]["EditorialReview"].each do |review|
          synopsis += review["Content"]
          synopsis += "\n-#{review['Source']}\n"
        end
      else
        synopsis = @response["EditorialReviews"]["EditorialReview"]["Content"]
      end
    end
    synopsis
  end

  def small_image
    add_image("MediumImage")
  end

  def large_image
    add_image("LargeImage")
  end

  private

  def item_attributes(response_field)
    output_string = ''
    if @response.class == Array
      @response.each do |item|
        if !item["ItemAttributes"].nil?
          if !item["ItemAttributes"][response_field].nil?
            output_string = item["ItemAttributes"][response_field]
          end
        end
      end
    elsif !@response["ItemAttributes"].nil?
      if !@response["ItemAttributes"][response_field].nil?
        output_string = @response["ItemAttributes"][response_field]
      end
    end
    output_string
  end

  def add_image(image_size)
    output_string = ''
    if @response.class == Array
      @response.each do |item|
        if !item[image_size].nil?
          output_string = item[image_size]["URL"]
        end
      end
    elsif !@response[image_size].nil?
      output_string = @response[image_size]["URL"]
    end
    output_string
  end
end
