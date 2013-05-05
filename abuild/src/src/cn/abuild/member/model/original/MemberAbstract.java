package cn.abuild.member.model.original;

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hi.framework.model.BaseObject;

import cn.abuild.member.model.Member;


public abstract class MemberAbstract extends BaseObject implements Serializable {
	private Integer id;
	private Integer version;
	private String member_name;
	private String password;
	private String description;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		if ((id != null && this.id == null) || this.id != null
				&& (!this.id.equals(id) || id == null)) {
			this.setDirty(true);
			this.oldValues.put("id", this.id);
		}
		this.id = id;
	}

	public Integer getVersion() {
		return this.version;
	}

	public void setVersion(Integer version) {
		if ((version != null && this.version == null) || this.version != null
				&& (!this.version.equals(version) || version == null)) {
			this.setDirty(true);
			this.oldValues.put("version", this.version);
		}
		this.version = version;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		if ((member_name != null && this.member_name == null)
				|| this.member_name != null
				&& (!this.member_name.equals(member_name) || member_name == null)) {
			this.setDirty(true);
			this.oldValues.put("member_name", this.member_name);
		}
		this.member_name = member_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		if ((password != null && this.password == null)
				|| this.password != null
				&& (!this.password.equals(password) || password == null)) {
			this.setDirty(true);
			this.oldValues.put("password", this.password);
		}
		this.password = password;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		if ((description != null && this.description == null)
				|| this.description != null
				&& (!this.description.equals(description) || description == null)) {
			this.setDirty(true);
			this.oldValues.put("description", this.description);
		}
		this.description = description;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Member))
			return false;
		Member castOther = (Member) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())));
	}

	public int hashCode() {
		HashCodeBuilder hcb = new HashCodeBuilder(17, 37);
		hcb.append(getId());
		hcb.append("Member".hashCode());
		return hcb.toHashCode();
	}

	public String toString() {
		ToStringBuilder sb = new ToStringBuilder(this,
				ToStringStyle.DEFAULT_STYLE);
		sb.append("id", this.id)
		.append("member_name", this.member_name)
		.append("password", this.password)
		.append("description", this.description);
		return sb.toString();
	}

	public Serializable getPrimarykey() {
		return id;
	}
}
