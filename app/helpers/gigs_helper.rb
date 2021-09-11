module GigsHelper
  def start_date_for_views(gig)
    gig.start_date.strftime("%B %d, %Y")
  end

  def start_time_for_views(gig)
    gig.start_date.strftime("%l:%M%P")
  end

  def end_date_for_views(gig)
    gig.end_date.strftime("%B %d, %Y")
  end

  def end_time_for_views(gig)
    gig.end_date.strftime("%B %d, %Y")
  end

  def same_day?(gig)
    true if gig.start_date.year == gig.end_date.year && gig.start_date.month == gig.end_date.month && gig.start_date.day == gig.end_date.day
  end
end
