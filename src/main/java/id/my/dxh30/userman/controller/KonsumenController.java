package id.my.dxh30.userman.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import id.my.dxh30.userman.dto.Konsumen;
import id.my.dxh30.userman.dto.Status;
import id.my.dxh30.userman.repository.KonsumenRepository;

@Controller
@RequestMapping(path = "/konsumen")
public class KonsumenController {
	@Autowired
	private KonsumenRepository konsumenRepository;

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<Konsumen> getAllKonsumen() {
		return konsumenRepository.findAll();
	}

	@GetMapping(path = "/")
	public String getView(Model model) {
		System.out.println("View Loading...");
		Iterable<Konsumen> konsumen = konsumenRepository.findAll();
		List<Konsumen> konsumenList = new ArrayList<Konsumen>();
		konsumen.iterator().forEachRemaining(konsumenList::add);
		System.out.println(konsumenList);
		konsumenList.forEach(item -> {
			System.out.println(item.getAlamat());
		});

		List<Integer> simple = new ArrayList<Integer>();
		simple.add(1);
		simple.add(2);
		simple.add(3);

		model.addAttribute("title", "List konsumen");
		model.addAttribute("konsumen", konsumenList);
		return "konsumen";
	}

	@GetMapping(path = "/edit")
	public String getEdit(@RequestParam int id, Model model) {
		System.out.println("Loading edit...");
		Konsumen konsumen = konsumenRepository.findById(id).orElse(null);
		model.addAttribute("konsumen", konsumen);
		model.addAttribute("title", "Edit konsumen");
		return "editKonsumen";
	}

	@PostMapping(path = "/update")
	public String updateKonsumen(@RequestParam int id, @RequestParam String nama, @RequestParam String alamat,
			@RequestParam String kota, @RequestParam String provinsi, @RequestParam String status) {
		Konsumen k = konsumenRepository.findById(id).orElse(null);
		k.setNama(nama);
		k.setAlamat(alamat);
		k.setKota(kota);
		k.setProvinsi(provinsi);
		k.setStatus(Status.valueOf(status));
		konsumenRepository.save(k);
		return "redirect:/konsumen/";
	}

	@GetMapping(path = "/get/{konsumenId}")
	public @ResponseBody Konsumen getKonsumen(@PathVariable(value = "konsumenId") int id) {
		return konsumenRepository.findById(id).orElse(null);
//				orElseThrow(() -> new KonsumenNotFoundException(id));
	}

	@GetMapping(path = "/delete")
	public String deleteKonsumen(@RequestParam int id) {
		konsumenRepository.deleteById(id);
		return "redirect:/konsumen/";
	}

	@PostMapping(path = "/add")
	public String addNewKonsumen(@RequestParam String nama, @RequestParam String alamat, @RequestParam String kota,
			@RequestParam String provinsi, @RequestParam String status) {
		System.out.println("Adding konsumen");
		Konsumen k = new Konsumen();
		k.setNama(nama);
		k.setAlamat(alamat);
		k.setKota(kota);
		k.setProvinsi(provinsi);
		k.setStatus(Status.valueOf(status));
		konsumenRepository.save(k);
//		return "Konsumen Saved";
		return "redirect:/konsumen/";
	}
}
