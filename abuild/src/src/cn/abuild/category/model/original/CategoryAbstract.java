package cn.abuild.category.model.original;

import java.io.Serializable;

import org.apache.commons.lang.builder.HashCodeBuilder;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.hi.framework.model.BaseObject;

import cn.abuild.category.model.Category;

public abstract class CategoryAbstract extends BaseObject implements
		Serializable {
	private Integer id;
	private Integer version;
	private String cate_name;
	private Integer member_id;

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

	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		if ((cate_name != null && this.cate_name == null)
				|| this.cate_name != null
				&& (!this.cate_name.equals(cate_name) || cate_name == null)) {
			this.setDirty(true);
			this.oldValues.put("cate_name", this.cate_name);
		}
		this.cate_name = cate_name;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		if ((member_id != null && this.member_id == null)
				|| this.member_id != null
				&& (!this.member_id.equals(member_id) || member_id == null)) {
			this.setDirty(true);
			this.oldValues.put("member_id", this.member_id);
		}
		this.member_id = member_id;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof Category))
			return false;
		Category castOther = (Category) other;

		return ((this.getId() == castOther.getId()) || (this.getId() != null
				&& castOther.getId() != null && this.getId().equals(
				castOther.getId())));
	}

	public int hashCode() {
		HashCodeBuilder hcb = new HashCodeBuilder(17, 37);
		hcb.append(getId());
		hcb.append("Category".hashCode());
		return hcb.toHashCode();
	}

	public String toString() {
		ToStringBuilder sb = new ToStringBuilder(this,
				ToStringStyle.DEFAULT_STYLE);
		sb.append("id", this.id).append("member_id", this.member_id)
				.append("cate_name", this.cate_name);
		return sb.toString();
	}

	@Override
	public Serializable getPrimarykey() {
		return this.id;
	}

}
