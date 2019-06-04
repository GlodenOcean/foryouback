package cn.online.shop.web.vo;

public class ZTreeNode {
	private String id;
		private String name;
		private String pId;
		private boolean isParent;
		private String iconSkin;
		private String uuid;
		private boolean checked;
		private String remark;
		private boolean isDbNode;
		private boolean open;
		private boolean canBeUse;
		
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getpId() {
			return pId;
		}
		public void setpId(String pId) {
			this.pId = pId;
		}
		public boolean isParent() {
			return isParent;
		}
		public void setParent(boolean isParent) {
			this.isParent = isParent;
		}
		public String getIconSkin() {
			return iconSkin;
		}
		public void setIconSkin(String iconSkin) {
			this.iconSkin = iconSkin;
		}
		public String getUuid() {
			return uuid;
		}
		public void setUuid(String uuid) {
			this.uuid = uuid;
		}
		public boolean isChecked() {
			return checked;
		}
		public void setChecked(boolean checked) {
			this.checked = checked;
		}
		public String getRemark() {
			return remark;
		}
		public void setRemark(String remark) {
			this.remark = remark;
		}
		public boolean isDbNode() {
			return isDbNode;
		}
		public void setDbNode(boolean isDbNode) {
			this.isDbNode = isDbNode;
		}
		public boolean isOpen() {
			return open;
		}
		public void setOpen(boolean open) {
			this.open = open;
		}
		public boolean isCanBeUse() {
			return canBeUse;
		}
		public void setCanBeUse(boolean canBeUse) {
			this.canBeUse = canBeUse;
		}
		
}

