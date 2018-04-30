import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import javax.script.*;
public class Calculate extends JFrame {
    JPanel resultPanel = new JPanel();
    JPanel buttonPanel = new JPanel();
    JTextField result = new JTextField(25);
    JButton numbers[] = new JButton[11];
    JButton operators[] = new JButton[6];
    JButton controls[] = {new JButton("C"), new JButton("<-"), new JButton("=")};
    StringBuffer formula = new StringBuffer("");
    static ScriptEngine jse = new ScriptEngineManager().getEngineByName("JavaScript");
    Dimension buttonSize = new Dimension(40,40);
    public Calculate(String name, int x, int y, int width, int height) {
	setResult();
	setOperator();
	setControl();
	setNumber();
	resultPanel.setLayout(new FlowLayout());
	add(resultPanel, BorderLayout.NORTH);
	buttonPanel.setLayout(new GridLayout(5, 4));
	add(buttonPanel, BorderLayout.CENTER);
	setTitle(name);
	setBounds(x, y, width, height);
	setVisible(true);
	setDefaultCloseOperation(EXIT_ON_CLOSE);
    }
    private void setListener(JButton button, String str) {
	button.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    formula.append(str);
		    result.setText(formula.toString());
		}
	    });
    }
    private void setResult() {
	result.addKeyListener(new KeyListener() {
		public void keyTyped(KeyEvent e) {}
		public void keyPressed(KeyEvent e) {}
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
	String ops[] = {"+", "-", "*", "/", "(", ")"};
	for(int i=0; i<ops.length; i++) {
	    operators[i] = new JButton(ops[i]);
	    operators[i].setPreferredSize(buttonSize);
	    setListener(operators[i], ops[i]);
	    buttonPanel.add(operators[i]);
	}
    }
    private void setNumber() {
	String nums[] = {"9", "8", "7", "6", "5", "4", "3", "2", "1", "0", "."};
	for(int i=0; i<nums.length; i++) {
	    numbers[i] = new JButton(nums[i]);
	    numbers[i].setPreferredSize(buttonSize);
	    setListener(numbers[i], nums[i]);
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
	
    
