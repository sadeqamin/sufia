class ContentBlock < ActiveRecord::Base
  MARKETING  = 'marketing_text'
  RESEARCHER = 'featured_researcher'
  ANNOUNCEMENT = 'announcement_text'
  ABOUTSTATS = 'about_stats_text'
  ABOUTSTATSTABLE = 'about_stats_table_text'
  ABOUTSTATSGRAPH = 'about_stats_graph_text'
  ABOUTSTATSOVERVIEW = 'about_stats_overview_text'

  def self.recent_researchers
    where(name: RESEARCHER).order('created_at DESC')
  end

  def self.featured_researcher
    recent_researchers.first
  end

  def self.external_keys
    { RESEARCHER => 'User' }
  end

  def external_key_name
    self.class.external_keys.fetch(name) { 'External Key' }
  end
end
