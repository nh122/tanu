class TanusController < ApplicationController
  def index
    @tanuki = Tanuki.order("RANDOM()").first
    logger.debug @tanuki
    logger.debug @tanuki.pic
  end

  def check
    logger.debug "-check-----------------------------------------------------------"
    logger.debug "-params[:race]-----------------------------------------------------------"
    logger.debug params[:race]
    logger.debug "-params[:realrace]-----------------------------------------------------------"
    logger.debug params[:realrace]
    @realrace = params[:realrace]
    logger.debug "-@result-----------------------------------------------------------"
    if params[:race] == 'タヌキ'
      if params[:realrace] == 'タヌキ'
        @result = 'true'
      else
        @result = 'false'
      end
    else
      if params[:realrace] != 'タヌキ'
        @result = 'true'
      else
        @result = 'false'
      end
    end
    logger.debug @result
  end

end
