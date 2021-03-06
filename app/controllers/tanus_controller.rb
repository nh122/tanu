class TanusController < ApplicationController
  @@lastid = 0
  @@random = Random.new
  
  def index
    logger.debug "-index---------------------------------------------"
    logger.debug "-@@lastid---------------------"
    logger.debug @@lastid
    
    logger.debug "-@tanuki.id---------------------------------------------"
    @tanuki = Tanuki.find(@@random.rand(1..Tanuki.count))
    logger.debug @tanuki.id

    
    if @tanuki.id == @@lastid
      logger.debug "前回と同じ値"
      @tanuki = Tanuki.find((@tanuki.id) % Tanuki.count + 1)
      logger.debug "-@tanuki.id変更----------------------"
      logger.debug @tanuki.id
    end

    logger.debug "-@@lastid更新---------------------"
    @@lastid = @tanuki.id
    logger.debug @@lastid

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
