class EventResponsesController < ApplicationController
  before_action :set_event_response, only: [:show, :edit, :update, :destroy]

  # GET /event_responses
  # GET /event_responses.json
  def index
    @event_responses = EventResponse.all
  end

  # GET /event_responses/1
  # GET /event_responses/1.json
  def show
  end

  # GET /event_responses/new
  def new
    @event_response = EventResponse.new
  end

  # GET /event_responses/1/edit
  def edit
  end

  # POST /event_responses
  # POST /event_responses.json
  def create
    @event_response = EventResponse.new(event_response_params)

    respond_to do |format|
      if @event_response.save
        format.html { redirect_to @event_response, notice: 'Event response was successfully created.' }
        format.json { render :show, status: :created, location: @event_response }
      else
        format.html { render :new }
        format.json { render json: @event_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_responses/1
  # PATCH/PUT /event_responses/1.json
  def update
    respond_to do |format|
      if @event_response.update(event_response_params)
        format.html { redirect_to @event_response, notice: 'Event response was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_response }
      else
        format.html { render :edit }
        format.json { render json: @event_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_responses/1
  # DELETE /event_responses/1.json
  def destroy
    @event_response.destroy
    respond_to do |format|
      format.html { redirect_to event_responses_url, notice: 'Event response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_response
      @event_response = EventResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_response_params
      params.fetch(:event_response, {})
    end
end
