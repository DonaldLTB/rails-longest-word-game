require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @word = JSON.parse(open(url).read)
    # raise
    letters = params[:letters].split
    word = params[:word]
    @end_result = word.chars.all? { |letter| word.count(letter) <= letters.count(letter.capitalize) }
  end
end
