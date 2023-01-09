module ApplicationHelper
  # タイトルをタブに表示する
  def set_title(title = '')
    brand = t('defaults.brand')
    title.empty? ? brand : "#{title} | #{brand}"
  end

  # recordのcreated_atとupdated_atの時間からクリアタイムを計算して返す
  def clear_time(record)
    return unless record.cleared?
    fin_time = record.updated_at
    st_time = record.created_at
    clear_time_second = fin_time - st_time
    day, sec_r = clear_time_second.divmod(86400) # １日は86400秒
    # クリアタイムをフォーマット化
    clear_time = (Time.parse("1/1") + sec_r).strftime("%H:%M:%S")
    day.zero? ? clear_time : "#{day} 日間 #{clear_time}"
  end

  # 難易度を表示する
  def label_level(record)
    "Level #{record.level_id}"
  end

  # 正答率を表示する
  def percentage_of_correct_answer(level)
    percentage = level.records.where(status: 'cleared').count.to_f / level.records.count.to_f * 100
    percentage.nan? ? "0%" : "#{percentage.floor}%"
  end

  # コードに含まれている改行コードを消す
  def remove_br(kusocode)
    kusocode.code.gsub(/[\r\n]/, '')
  end

  # lv1のクロスワードの回答を表示する
  def lv1_crossword_answer(x, y)
    a_heads = [6, 5, 6, 5, 5, 1, 6, 3]
    ans_array = @answers.select{|answer|answer.quiz_id == 9 - x}
    return if ans_array[0].nil? || ans_array[0].answer.nil?
    answer = ans_array[0].answer
    return if y < a_heads[x - 1] || y > a_heads[x - 1] + answer.length
    str_array = answer.chars
    str_array[y - a_heads[x - 1]]
  end
end
