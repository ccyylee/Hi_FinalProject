package kh.spring.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MealDTO;
import kh.spring.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO dao;
	
	public void join(MemberDTO dto) {
		dao.join(dto);
	}
	public MemberDTO login(String email, String pw) {
		Map<String,String> param = new HashMap<>();
		param.put("email",email);
		param.put("pw", pw);
		return dao.login(param);
	}
	public int idCheck(String memberId){
		return dao.idCheck(memberId);
	}
	public void modiName(MemberDTO dto) {
		dao.modiName(dto);
	}
	public void modiSchool(MemberDTO dto) {
		dao.modiSchool(dto);
	}
	public void modiPhone(MemberDTO dto) {
		dao.modiPhone(dto);
	}
	public void modiAge(MemberDTO dto) {
		dao.modiAge(dto);
	}
	public void modiPw(MemberDTO dto) {
		dao.modiPw(dto);
	}
	public int pwck(String email, String pw){
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pw", pw);
		
		return dao.pwck(map);
	}
	
	public String updateProfile(MemberDTO dto, MultipartFile file, String realPath) throws Exception {
			File filesPath = new File(realPath);
			if(!filesPath.exists()) {
				filesPath.mkdir();
			}
			String oriName = file.getOriginalFilename();
			String sysName = UUID.randomUUID().toString().replace("-", "") + "_" + oriName;
			file.transferTo(new File(filesPath.getAbsolutePath()+"/"+sysName));
			
			System.out.println(filesPath.getAbsolutePath()+"/"+sysName);
			System.out.println(realPath+"/"+sysName);
			
			dto.setOriName(oriName);
			dto.setSysName(sysName);

			dao.updateProfile(dto);
			
			return sysName;
		}
	
}
