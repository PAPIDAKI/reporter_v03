module ApplicationHelper
  def format_date(date)
    return '' if date.nil?

    formatted_date = date.strftime('%d %b %a %Y')
    formatted_date
  end

  def remove_decimal(number)
    integer_part = number.to_i
    number_with_delimiter(integer_part,delimiter:'.')
  end

  def remove_unwanted_text(str)
        # Remove text inside parentheses
       str = str.gsub(/\(.*?\)/, '')
       # Remove 'ΣΤΑΦΙΔΑ'
       str = str.gsub('ΣΤΑΦΙΔΑ', '')
       str = str.gsub('ΣΤΑΦΙΔ.ΣΟΥΛΤΑΝ 10ΚΙΛΟ ΧΥΜΑ','ΑΠΟΞ ΧΥΜΑ')
       str = str.gsub('10/ΧΥΜΑ','')
       str = str.gsub('ΣΤΑΦΙΔ.ΣΟΥΛΤ.','')
       str = str.gsub('ΣΤΑΦΙΔ.ΣΟΥΛΤΑΝ.','')
       str = str.gsub('ΣΤΑΦΙΔ.ΣΟΥΛΤΑΝ','')
       str = str.gsub('10KGS/ΧΥΜΑ','')
       str = str.gsub('ΧΥΜΑ','')
       #str = str.gsub('ΣΤΑΦΙΔA No 0','0')
       #str = str.gsub('No 1','1')
       #str = str.gsub('Νο 2','2')
       #str = str.gsub('Τ.00','00 ')
       #str = str.gsub('10ΚΙΛΟ','')
       str.strip
  end

      def  customer_since
                oldest_date = Sale.minimum(:date)
                oldest_sale = Sale.find_by(date: oldest_date) if oldest_date

                    if oldest_date
                            years_passed = ((Date.current - @oldest_date) / 365.25).floor
                    end
      end


      def current_year(sales)
            filtered_sales = sales.where("date >= ?", 365.days.ago.to_date)
                filtered_sales.sum(:kg)
     end
      



end
