class Report
  def output_report
    output_start
    output_body
    output_end
  end

  def output_start; end
  def output_body; end
  def output_line(line); end
  def output_end; end
end

class HtmlReport < Report
  def output_start
    # 実装
  end

  def output_body
    # 実装
  end

  def output_end
    # 実装
  end
end

class PlaneTextReport < Report
  def output_start
    # 実装
  end

  def output_body
    # 実装
  end

  def output_end
    # 実装
  end
end

html_report = HtmlReport.new
html_report.output_report
plane_text_report = PlaneTextReport.new
plane_text_report.output_report
