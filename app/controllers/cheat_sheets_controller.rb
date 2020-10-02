class CheatSheetsController < ApplicationController


  def index
    @cheatsheets = CheatSheet.all
  end

  def new
    # render json: {name: "hello"}
    @cheatsheet  = CheatSheet.new
  end

  def create
    puts "[----params--",cheat_sheet_params
    @cheatsheet = CheatSheet.create(cheat_sheet_params)
    puts "object",@cheatsheet.stitches.inspect
    if @cheatsheet.save
      redirect_to @cheatsheet, notice: "cheatsheet was created successfully"
    else
      render :new
    end
  end

  def show
    @cheatsheet = CheatSheet.find(params[:id])
  end

  def download
    puts "params",params
    @cheatsheet = CheatSheet.find(params[:id])
    html = render_to_string(:action => :show,template: "cheat_sheets/show.html.erb") 
    pdf = WickedPdf.new.pdf_from_string(html) 

    send_data(pdf, 
      :filename => "#{@cheatsheet.title}.pdf", 
      :disposition => 'attachment') 
  end

  private

  def cheat_sheet_params
    params.required(:cheat_sheet).permit(:title,
                                  stitches_attributes: [:id, :master_stitch_id, :total_stitch , :_destroy])
  end
end