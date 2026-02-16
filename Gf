fimport streamlit as st
import google.generativeai as genai

# Konfigurasi AI
# Ganti dengan API Key kamu dari Google AI Studio
genai.configure(api_key="MASUKKAN_API_KEY_KAMU_DISINI")
model = genai.GenerativeModel('gemini-1.5-flash')

st.set_page_config(page_title="AI Affiliate", page_icon="🧡")

st.title("🚀 Shopee Viral Generator")
st.write("Bikin caption video jualan otomatis pakai AI")

produk = st.text_input("Nama Barang", placeholder="Misal: Gamis Rayon Premium")

if st.button("Buat Caption 🔥"):
    if produk:
        with st.spinner('Lagi mikir...'):
            prompt = f"Buatkan caption Shopee Video yang viral untuk {produk}. Gunakan bahasa gaul, persuasif, banyak emoji, dan suruh cek keranjang orange."
            response = model.generate_content(prompt)
            st.subheader("Hasil (Siap Copy):")
            st.code(response.text) # Kotak yang bisa diklik untuk copy
    else:
        st.error("Isi dulu nama barangnya!")
