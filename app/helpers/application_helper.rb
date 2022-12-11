module ApplicationHelper
  # recordのcreated_atとupdated_atの時間からクリアタイムを計算して返す
  def clear_time(record)
    return record.status unless record.cleared?
    fin_time = record.updated_at
    st_time = record.created_at
    clear_time = fin_time - st_time
    day, sec_r = celar_time.divmod(86400) # １日は86400秒
    # クリアタイムをフォーマット化
    (Time.parse("1/1") + sec_r).strftime("#{day}日　%H:%M:%S:")
  end

  # タイトルをタブに表示する
  def set_title(title = '')
    brand = t('defaults.brand')
    title.empty? ? brand : title + ' | ' + brand
  end
end
