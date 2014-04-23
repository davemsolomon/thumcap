require 'net/http'
require 'uri'

class CapthuritsController < ApplicationController
  before_action :set_capthurit, only: [:show, :edit, :update, :destroy]

  def follow
	x = 1
	url = URI.parse('http://bbcwssc.ic.llnwd.net/')
	Net::HTTP.start(url.host, url.port) do |http|       
	randomstring = ('A'..'Z').to_a.shuffle[0,6].join
	filepath = "/var/capthurits/".to_s + randomstring.to_s + ".mp3".to_s
	f5 = open(filepath, "w+b")
	buffer = Array.new(240)
        begin
            http.request_get('/stream/bbcwssc_mp1_ws-eieuk') do |resp|              
            resp.read_body do |segment|
		buffer[x] = segment
		x = x + 1
		break if x == 240              
            end
	    puts "outer x=".to_s + x.to_s
            for i in 2..240
		f5.write(buffer[i])
	    end
	    break if x == 240
            end
        ensure
            f5.close()
        end     
    end
  end
  
  # GET /capthurits
  # GET /capthurits.json
  def index
    me = david.new
    me.greets
    @capthurits = Capthurit.all
  end

  def hello
    puts "hello world passover"
  end


  # GET /capthurits/1
  # GET /capthurits/1.json
  def show
  end

  # GET /capthurits/new
  def new
    @capthurit = Capthurit.new
  end

  # GET /capthurits/1/edit
  def edit
  end

  # POST /capthurits
  # POST /capthurits.json
  def create
    @capthurit = Capthurit.new(capthurit_params)

    respond_to do |format|
      if @capthurit.save
        format.html { redirect_to @capthurit, notice: 'Capthurit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @capthurit }
      else
        format.html { render action: 'new' }
        format.json { render json: @capthurit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capthurits/1
  # PATCH/PUT /capthurits/1.json
  def update
    respond_to do |format|
      if @capthurit.update(capthurit_params)
        format.html { redirect_to @capthurit, notice: 'Capthurit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @capthurit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capthurits/1
  # DELETE /capthurits/1.json
  def destroy
    @capthurit.destroy
    respond_to do |format|
      format.html { redirect_to capthurits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capthurit
      @capthurit = Capthurit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def capthurit_params
      params.require(:capthurit).permit(:filename, :stationname, :capthurstart)
    end
end
