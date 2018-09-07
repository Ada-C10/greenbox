require 'csv'

module GreenBox
  class Movie
    attr_reader :id, :title, :publisher, :actors

    def initialize(id,title,publisher, actors:[])
      @id = id
      @title = title
      @publisher = publisher
      @actors = actors
    end

    movie = GreenBox::Movie.new(4,'Happiness','Fox',actors:['Denzel Washington', 'LL Cool J'])


    def stars_actor(actor_name)
      actors.each do |actor|
        if actor_name == actor
          return true
        end
      end
      return false
    end
  end
end
