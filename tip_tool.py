import tkinter as tk
import win32clipboard
import win32gui
import keyboard

class WordCaptureApp:
    def __init__(self):
        self.root = tk.Tk()
        self.root.withdraw()  # 隐藏主窗口
        self.root.after(0, self.check_hotkeys)  # 检查热键

    def check_hotkeys(self):
        if keyboard.is_pressed('f2'):
            self.show_selected_word()
        elif keyboard.is_pressed('s'):
            self.show_selected_word_one_by_one()

        self.root.after(10, self.check_hotkeys)  # 每隔10毫秒检查一次

    def show_selected_word(self):
        word = self.get_selected_word()
        if word:
            self.show_popup_window(word)

    def show_selected_word_one_by_one(self):
        word = self.get_selected_word()
        if word:
            self.show_word_window(word)

    def get_selected_word(self):
        win32clipboard.OpenClipboard()
        word = win32clipboard.GetClipboardData()
        win32clipboard.CloseClipboard()
        return word

    def show_popup_window(self, word):
        popup = tk.Toplevel()
        popup.geometry(f"+{self.root.winfo_pointerx()+10}+{self.root.winfo_pointery()+10}")
        label = tk.Label(popup, text=word)
        label.pack()
        popup.after(3000, popup.destroy)  # 3秒后关闭窗口

    def show_word_window(self, word):
        window = tk.Toplevel()
        window.title("Selected Word")
        window.geometry("200x100")
        label = tk.Label(window, text=word)
        label.pack()

    def run(self):
        self.root.mainloop()

if __name__ == '__main__':
    app = WordCaptureApp()
    app.run()
