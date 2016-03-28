# frozen_string_literal: true

class SiteController < ApplicationController
  def index
    render text: 'Hello World!'
  end
end
