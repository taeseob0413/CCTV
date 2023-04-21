package com.firstclass.childrenctv.user;

import com.firstclass.childrenctv.util.email.GmailService;
import com.firstclass.childrenctv.util.email.MailText;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private final UserMapper userMapper;
    private final GmailService gmailService;
    

    @Override
    public void signup(UserVO user) {
    	userMapper.insert(user);	
    }
    
	@Override
	public int idcheck(String loginid) {
    	return userMapper.idcheck(loginid); 
	}
	
	@Override
	public String emailcheck(String email) {
		String code = gmailService.send1(email);
		return code;
	}

    @Override
    public UserVO signIn(String loginid, String password) {
        UserVO user = null;
        try {
            user = userMapper.existUserByIdAndPassword(loginid, password);
        }catch (Exception e){

        }
        return user;
    }

    @Override
    public String findId(String name, String email) {
        String userLoginId = null;
        try {
            UserVO user = userMapper.existUserByNameAndEmail(name, email);
            userLoginId = user.getUser_loginID();
        }catch (Exception e){

        }
        return userLoginId;
    }

    @Override
    public boolean findpass(String name, String email, String loginId) {
        UserVO user = null;

        try {
            user = userMapper.existUserByNameAndEmail(name, email);
            if(!user.getUser_loginID().equals(loginId)) return false;

            gmailService.send(email, "[CCTV] 비밀번호를 알려드립니다.",
                    MailText.getFindPassword(user.getUser_name(), user.getUser_password()));
        }catch (Exception e){
            return false;
        }
        return true;
    }

    @Override
    public void infoUpdate(UserVO user) {

    }

    @Override
    public List<UserVO> getAllUserList() {
        return null;
    }
}
