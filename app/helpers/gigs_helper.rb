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

  def happened_already?(gig)
    true if Date.today > gig.start_date
  end

  def open_auditions?(gig)
    true if gig.auditions.any? {|a| a.open == true }
  end

  def audition_denied?(gig)
    true if gig.auditions.any? {|a| a.musician == current_user && a.open == false }
  end

  def instrumentalist(instrument)
    if instrument.name == "Drums"
      "Drummer"
    elsif instrument.name == "Trumpet"
      "Trumpeter"
    elsif instrument.name.end_with?("Sax")
      instrument.name + "ophonist"
    elsif instrument.name.match?(/[aeiou]$/)
      instrument.name.gsub(/[aeiou]$/, "ist")
    elsif instrument.name.end_with?("s") && !instrument.name.end_with?("Bass")
      instrument.name.delete_suffix("s") + "ist"
    else
      instrument.name + "ist"
    end
  end

  def may_want_to_audition(user, gig)
    true if user.type == "Musician" && gig.open_instrument_slots.include?(user.instrument)
  end
end
