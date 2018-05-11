import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.script.*;
public class Calculate extends JFrame {
	//设置两个面板容器，方便布局
    JPanel resultPanel = new JPanel();
    JPanel buttonPanel = new JPanel();
    JTextField result = new JTextField(25);
    JButton numbers[] = {new JButton("9"), new JButton("8"), new JButton("7"), new JButton("6"), new JButton("5"), new JButton("4"), new JButton("3"), new JButton("2"), new JButton("1"), new JButton("0"), new JButton(".")};
    JButton operators[] = {new JButton("+"), new JButton("-"), new JButton("*"), new JButton("/"), new JButton("("), new JButton(")")};
    JButton controls[] = {new JButton("C"), new JButton("<-"), new JButton("=")};
    StringBuffer formula = new StringBuffer("");
    static ScriptEngine jse = new ScriptEngineManager().getEngineByName("JavaScript");
    Dimension buttonSize = new Dimension(40,40);
    public Calculate(String name, int x, int y, int width, int height) {
	setResult();
	setOperator();
	setControl();
	setNumber();
	    //布局
	resultPanel.setLayout(new FlowLayout());
	add(resultPanel, BorderLayout.NORTH);
	buttonPanel.setLayout(new GridLayout(5, 4));
	add(buttonPanel, BorderLayout.CENTER);
	    
	setTitle(name);
	setBounds(x, y, width, height);
	setVisible(true);
	setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
	//对于数字按钮、运算符按钮通用的监听器
    private void setListener(JButton button) {
	button.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    JButton tmp = (JButton)e.getSource();
		    formula.append(tmp.getText());
		    result.setText(formula.toString());
		}
	    });
    }
    private void setResult() {
	    //键盘事件的监听器
	result.addKeyListener(new KeyListener() {
		public void keyTyped(KeyEvent e) {}
		public void keyPressed(KeyEvent e) {}
		//当按键释放时，将formula替换为文本区中的内容
		public void keyReleased(KeyEvent e) {
		    formula.replace(0, formula.length(), result.getText());
		}
	    });
	result.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    try {
			formula.replace(0, formula.length(), jse.eval(formula.toString()).toString());
			result.setText(formula.toString());
		    }
		    catch(Exception ee) {
			result.setText("算式不合法");
		    }
		}
	    });
	resultPanel.add(result);
    }
    private void setOperator() {
	for(int i=0; i<operators.length; i++) {
	    operators[i].setPreferredSize(buttonSize);
	    setListener(operators[i]);
	    buttonPanel.add(operators[i]);
	}
    }
    private void setNumber() {
	for(int i=0; i<numbers.length; i++) {
	    numbers[i].setPreferredSize(buttonSize);
	    setListener(numbers[i]);
	    buttonPanel.add(numbers[i]);
	}
    }
    private void setControl() {
	controls[0].addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    formula.delete(0, formula.length());
		    result.setText(formula.toString());
		}
	    });
	controls[1].addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    formula.delete(formula.length()-1, formula.length());
		    result.setText(formula.toString());
		}
	    });
	controls[2].addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    try {
			formula.replace(0, formula.length(), jse.eval(formula.toString()).toString());
			result.setText(formula.toString());
		    }
		    catch(Exception ee) {
			result.setText("算式不合法");
		    }
		}
	    });
	for(JButton con:controls) {
	    con.setPreferredSize(buttonSize);
	    buttonPanel.add(con);
	}
    }
}
	
    
