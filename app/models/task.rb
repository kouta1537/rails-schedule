class Task < ApplicationRecord
    validates :title, presence: true, length: {maximum: 20}
    validates :start_datetime, presence: true
    validates :end_datetime, presence: true
    validates :memo, length: {maximum: 500}
    validate :start_end_check

    def start_end_check
        if start_datetime.present?&& end_datetime.present?
        errors.add(:end_datetime,"は開始日より遅い日時を選択してください")unless
        self.start_datetime < self.end_datetime
        end
    end
end
