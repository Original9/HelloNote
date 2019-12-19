package co.yedam.hellonote.user.vo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import co.yedam.hellonote.common.MessageUtil;
import co.yedam.hellonote.user.login.NaverLoginApi;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class UserVO implements UserDetails {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String hellonoteId;
	String pw;
	String gender;
	String hGrant;
	String age;
	String hProfile;
	
	

	public String gethGrant() {
		return hGrant;
	}

	public void sethGrant(String hGrant) {
		this.hGrant = hGrant;
	}

	public String gethProfile() {
		return hProfile;
	}

	public void sethProfile(String hProfile) {
		this.hProfile = hProfile;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
		auth.add(new SimpleGrantedAuthority(this.gethGrant()));
		return auth;
	}

	@Override
	public String getPassword() {
		return pw;
	}

	@Override
	public String getUsername() {
		return hellonoteId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
}
