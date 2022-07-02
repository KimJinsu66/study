class Movie
  def calculate_fee(screening_name, discount_type)
    DiscountAmount.new(movie_fee(screening_name), discount_type).calculate_discount_amount
  end

  private

  def movie_fee(name)
    # 普段はDBで取るべき
    case name
    when 'GA'
      10_000
    end
  end
end

class DiscountAmount
  def initialize(fee, discount_type)
    @fee = fee
    @discount_type = discount_type
  end

  def calculate_discount_amount
    case @discount_type
    when '20%'
      @fee * 0.8
    else
      @fee
    end
  end
end

class Screening
  def initialize(name)
    @name = name
  end

  def reserve(audience_count:, discount_type:)
    Reserve.new(@name, discount_type, audience_count).reserve
  end
end

class Reserve
  def initialize(movie_name, discount_type, audience_count)
    @movie_name = movie_name
    @discount_type = discount_type
    @audience_count = audience_count
  end

  def reserve
    fee = Movie.new.calculate_fee(@movie_name, @discount_type) * @audience_count.to_i

    success_messeage(fee)
  end

  private

  def success_messeage(fee)
    p "#{@name} 예약이 완료되었습니다. 요금은#{fee}입니다"
  end
end

# discount_type은 enum으로 하면 좋다.
Screening.new('GA').reserve(audience_count: 3, discount_type: '20%')
