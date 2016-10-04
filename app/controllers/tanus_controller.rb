class TanusController < ApplicationController
  def index
    logger.debug "-index---------------------------------------------"
    logger.debug "-@tanuki.id---------------------------------------------"
    @tanuki = Tanuki.order("RANDOM()").first
    logger.debug @tanuki.id

    logger.debug @tanuki
    logger.debug @tanuki.pic
    
  end

  def check
    logger.debug "-check-----------------------------------------------------------"
    logger.debug "-params[:record]-----------------------------------------------------------"
    logger.debug params[:record]
    @tanuki = Tanuki.find(params[:record])

    logger.debug "-params[:race]-----------------------------------------------------------"
    logger.debug params[:race]

    logger.debug "-@realrace-----------------------------------------------------------"
    @realrace = @tanuki.race
    logger.debug @realrace
    
    logger.debug "-@result-----------------------------------------------------------"
    if params[:race] == 'タヌキ'
      if @realrace == 'タヌキ'
        @result = 'true'
      else
        @result = 'false'
      end
    else
      if @realrace != 'タヌキ'
        @result = 'true'
      else
        @result = 'false'
      end
    end
    logger.debug @result
    
    logger.debug "-trial,correct-----------------------------------------------------------"
    logger.debug @tanuki.trial
    logger.debug @tanuki.correct
    @tanuki.increment(:trial)
    if @result == 'true'
      @tanuki.increment(:correct)
    else
      logger.debug @result
    end
    logger.debug "-+trial,correct-----------------------------------------------------------"
    logger.debug @tanuki.trial
    logger.debug @tanuki.correct
    
    @tanuki.save

  end

end
