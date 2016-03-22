namespace :petitions do
  desc "check all petitions"
  task check_old: :environment do
  VotingEndingJob.perform_later
  PetitionCheckerJob.perform_later
  end

end
