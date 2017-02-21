class Supports::SuggestionSupport
  attr_reader :param
  def initialize param
    @param = param
  end

  def processing
    @processing_suggestions ||= Suggestion.processing.newest
      .paginate page: @param, per_page: Settings.suggestions.per_page
  end

  def accepted
    @accepted_suggestions ||= Suggestion.accepted.newest
      .paginate page: @param, per_page: Settings.suggestions.per_page
  end

  def rejected
    @rejected_suggestions ||= Suggestion.rejected.newest
      .paginate page: @param, per_page: Settings.suggestions.per_page
  end
end
