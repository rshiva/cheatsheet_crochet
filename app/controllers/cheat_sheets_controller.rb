class CheatSheetsController < ApplicationController


  def index
    @cheatsheets = CheatSheet.all
  end

  def new
    @cheatsheet  = CheatSheet.new
  end

  def show
    @cheatsheet = CheatSheet.find(params[:id])
    @download = true
  end

  def create
    @cheatsheet = CheatSheet.create(cheat_sheet_params)
    if @cheatsheet.save
      redirect_to @cheatsheet, notice: "cheatsheet was created successfully"
    else
      render :new
    end
  end

  def edit
    @cheatsheet = CheatSheet.find(params[:id])
  end

  def update
    @cheatsheet = CheatSheet.find(params[:id])
    if @cheatsheet.update(cheat_sheet_params)
      redirect_to @cheatsheet, notice: "cheatsheet was updated successfully"
    else
      render :edit
    end
  end

  



  def download
    @cheatsheet = CheatSheet.find(params[:id])
    render pdf: "#{@cheatsheet.title}.pdf",  template: "cheat_sheets/show.pdf.erb",layout: "pdf.html", page_size: "A4"
  end

  private

  def cheat_sheet_params
    params.required(:cheat_sheet).permit(:title,:instruction,
                                  stitches_attributes: [:id, :master_stitch_id, :total_stitch , :_destroy])
  end
end