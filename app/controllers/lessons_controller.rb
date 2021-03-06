class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    @completed_count = Lesson.where(completed: true).count
    @total_count = Lesson.count
    @completed_precent = @completed_count.to_f / @total_count
    
    @lessons = Lesson.order(completed: :asc, id: :desc).paginate(page: params[:page], per_page: 30)
  end

  # GET /lessons/1
  # GET /lessons/1.json
  # def show
  # end

  # GET /lessons/new
  def new
    lessons = EngSource.get
    
    count = 0
    
    lessons.each do |lesson|
      unless Lesson.where('title = ?', lesson[:title]).count > 0
        Lesson.create(lesson)
        count = count + 1
      end
    end

    @lessons = Lesson.order('id DESC')
    
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: count.to_s + ' lesson(s) had been successfully updated.' }
      format.json { render :index, status: :ok }
    end
  end

  # GET /lessons/1/edit
  # def edit
  # end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    if (@lesson.completed && params[:lesson][:completed] == 'false') || !@lesson.completed
      @lesson.completed = !@lesson.completed
      @lesson.save
    end
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully updated.' }
      format.json { render :show, status: :ok }
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :image, :url, :completed)
    end
end
