class Supports::RequestSupport
  attr_reader :page

  def initialize page
    @page = page
  end

  def waiting
    Shop.waiting.order_date_desc.paginate page: @page,
      per_page: Settings.per_page
  end

  def approve
    Shop.approved.order_date_desc.paginate page: @page,
      per_page: Settings.per_page
  end

  def reject
    Shop.rejected.order_date_desc.paginate page: @page,
      per_page: Settings.per_page
  end
 end
