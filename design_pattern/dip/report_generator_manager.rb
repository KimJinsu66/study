class ReportGeneratorManager
  def initialize(data, generator = XmlRaportGenerator)
    @data = data
    @generator = generator
  end

  def call
    generate_report
    print_dip_description
  end

  private

  attr_reader :data, :generator

  def generate_report
    generator.new(data).generate
  end

  def print_dip_description
    p 'DIP 의존성 뒤집기 원칙'
  end
end

class XmlRaportGenerator
  def initialize(data)
    @data = data
  end

  def generate
    p "XmlRaportGenerator 生成する"
  end
end

ReportGeneratorManager.new("test").call
