class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :show
  
  def show
    current_course = current_lesson.section.course
    enrollment = Enrollment.find_by(course: current_course, user: current_user)
    if enrollment.nil?
      redirect_to course_path(current_course), alert: "You are not enrolled in a course!"
    end
  end
  
  private
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
