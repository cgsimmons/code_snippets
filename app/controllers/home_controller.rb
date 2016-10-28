class HomeController < ApplicationController

  def index
    @languages = Language.all
  end
end

# find_by_sql("SELECT DISTINCT requests.department, COUNT(requests.department) FROM requests GROUP BY requests.department ORDER BY requests.department")
