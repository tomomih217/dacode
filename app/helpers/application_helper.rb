module ApplicationHelper
  # recordのcreated_atとupdated_atの時間からクリアタイムを計算して返す
  def clear_time(record)
    return unless record.cleared?
    fin_time = record.updated_at
    st_time = record.created_at
    fin_time - st_time
  end
  
  def clear_time_formated(record)
    return record.status unless record.cleared?
    clear_time_second = clear_time(record)
    day, sec_r = clear_time_second.divmod(86400) # １日は86400秒
    # クリアタイムをフォーマット化
    clear_time_formated = (Time.parse("1/1") + sec_r).strftime("%H:%M:%S")
    day.zero? ? clear_time_formated : day + '日間 ' + clear_time_formated
  end

  # タイトルをタブに表示する
  def set_title(title = '')
    brand = t('defaults.brand')
    title.empty? ? brand : title + ' | ' + brand
  end
end
