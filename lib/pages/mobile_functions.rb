module CalabashAndroidDemoProject
  class MobileFunctions
    def verify_element(uiquery,max_wait_time=10)
      wait_for_element_exists("#{uiquery}",:timeout=> max_wait_time)
    end

    def get_element_text(uiquery)
      verify_element(uiquery)
      return query(uiquery, :text)[0]
    end

    def touch_element(uiquery)
      verify_element(uiquery)
      touch(uiquery)
    end

    def clear_text_field(uiquery)
      puts "in clear text"
      verify_element(uiquery)
      begin
        touch_element(uiquery)
        clear_text(uiquery)
      rescue Exception => e
        $LOG.error e.message
      ensure
        (0..5).each do
          keyboard_enter_char 'Delete'
        end
      end
    end

    def enter_text(uiquery,text)

      if text != nil
        begin
          enter_text(uiquery,text)
        rescue
          touch(uiquery)
          sleep 1
          keyboard_enter_text(text)
        end
      end
    end

    def swipe_screen

    end

    def scroll_screen(uiquery, direction)
      scroll(uiquery, direction)
    end
  end
end