<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class login_model extends CI_Model {

	function cekuser($user,$pass)
	{
		$this->db->select('*');
		$this->db->from('tbl_user_login a');
		$this->db->join('tbl_karyawan b', 'a.IDKary = b.IDKary');
		$this->db->join('tbl_jabatan c', 'b.kode_jabatan = c.kode_jabatan');
		$this->db->where('a.username', $user);
		$this->db->where('a.password', sha1(md5($pass).key));
		$this->db->where('a.status', 1);
		$this->db->where('b.status', 1);
		
		$q = $this->db->get();
		return $q;
	}

	function getparentmenu()
	{
		$sess = $this->session->userdata('sess_login'); 
		$jabatan = $sess['kode_jabatan'];
		$this->db->select('*');
		$this->db->from('tbl_menu a');
		$this->db->join('tbl_user_access b', 'a.id_menu = b.menu_id');
		$this->db->join('tbl_karyawan c', 'b.kode_jabatan = c.kode_jabatan');
		$this->db->where('a.parent', 0);
		$this->db->where('b.kode_jabatan', $jabatan);
		$this->db->order_by('a.menu', 'asc');

		$q = $this->db->get();
		return $q;
	}

	function getmenu($id)
	{
		$sess = $this->session->userdata('sess_login'); 
		$jabatan = $sess['kode_jabatan'];
		$this->db->select('*');
		$this->db->from('tbl_menu a');
		$this->db->join('tbl_user_access b', 'a.id_menu = b.menu_id');
		$this->db->join('tbl_karyawan c', 'b.kode_jabatan = c.kode_jabatan');
		$this->db->where('a.parent', $id);
		$this->db->where('b.kode_jabatan', $jabatan);
		$q = $this->db->get();
		return $q;	
	}

}

/* End of file login_model.php */
/* Location: ./application/models/login_model.php */