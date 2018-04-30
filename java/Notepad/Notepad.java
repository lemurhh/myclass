import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class Notepad extends JFrame {
    JMenuBar menubar = new JMenuBar();
    JMenu file = new JMenu("文件");
    JMenu edit = new JMenu("编辑");
    JMenu format = new JMenu("格式");
    JMenu check = new JMenu("查看");
    JMenu help = new JMenu("帮助");
    JMenuItem itemOfFile[] = {new JMenuItem("新建"), new JMenuItem("打开"), new JMenuItem("保存"), new JMenuItem("另存为"), new JMenuItem("页面设置"), new JMenuItem("打印"), new JMenuItem("退出")};
    JMenuItem itemOfEdit[] = {new JMenuItem("撤销"), new JMenuItem("剪切"), new JMenuItem("复制"), new JMenuItem("粘贴"), new JMenuItem("删除"), new JMenuItem("查找"), new JMenuItem("查找下一个"), new JMenuItem("替换"), new JMenuItem("转到"), new JMenuItem("全选"), new JMenuItem("时间/日期")};
    JMenuItem itemOfFormat[] = {new JMenuItem("自动换行"), new JMenuItem("字体")};
    JMenuItem itemOfCheck[] = {new JMenuItem("状态栏")};
    JMenuItem itemOfHelp[] = {new JMenuItem("帮助主题"), new JMenuItem("关于记事本")};
    JScrollPane textEditor = new JScrollPane(new JTextArea(50, 90));
    public Notepad(int x, int y, int width, int height) {
	setFile();
	setEdit();
	setFormat();
	setCheck();
	setHelp();
	add(textEditor);
	setTitle("记事本");
	setBounds(x, y, width, height);
	setVisible(true);
	setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	setLayout(new FlowLayout());
	setJMenuBar(menubar);
    }
    private void setFile() {
	for(int i=0; i<itemOfFile.length; i++) {
	    JMenuItem item = itemOfFile[i];
	    switch(i) {
	    case 0:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, InputEvent.CTRL_MASK));break;
	    case 1:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, InputEvent.CTRL_MASK));break;
	    case 2:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, InputEvent.CTRL_MASK));break;
	    case 5:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, InputEvent.CTRL_MASK));break;
	    default:break;
	    }
	    file.add(item);
	    if(i==3 || i==5)
		file.addSeparator();
	}
	menubar.add(file);
    }
    private void setEdit() {
	for(int i=0; i<itemOfEdit.length; i++) {
	    JMenuItem item = itemOfEdit[i];
	    switch(i) {
	    case 0:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Z, InputEvent.CTRL_MASK));break;
	    case 1:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_X, InputEvent.CTRL_MASK));break;
	    case 2:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, InputEvent.CTRL_MASK));break;
	    case 3:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_V, InputEvent.CTRL_MASK));break;
	    case 5:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F, InputEvent.CTRL_MASK));break;
		//case 6:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F3));break;
	    case 7:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, InputEvent.CTRL_MASK));break;
	    case 8:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, InputEvent.CTRL_MASK));break;
	    case 9:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, InputEvent.CTRL_MASK));break;
		//case 10:item.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F5));break;
	    default:break;
	    }
	    edit.add(item);
	    if(i==0 || i==4 || i==8)
		edit.addSeparator();
	}
	menubar.add(edit);
    }
    private void setFormat() {
	for(JMenuItem item:itemOfFormat)
	    format.add(item);
	menubar.add(format);
    }
    private void setCheck() {
	for(JMenuItem item:itemOfCheck)
	    check.add(item);
	menubar.add(check);
    }
    private void setHelp() {
	for(JMenuItem item:itemOfHelp)
	    help.add(item);
	menubar.add(help);
    }
}

